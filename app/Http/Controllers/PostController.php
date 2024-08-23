<?php

namespace App\Http\Controllers;

use App\Http\Requests\PostRequest;
use App\Http\Requests\UpdatePostRequest;
use App\Http\Resources\PostLikeResource;
use App\Http\Resources\PostListResource;
use App\Http\Resources\PostResource;
use App\Models\Post;
use App\Models\PostComment;
use App\Models\PostLike;
use App\Models\Tag;
use App\Traits\ApiResponseTrait;
use Dotenv\Exception\ValidationException;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class PostController extends Controller
{
    use ApiResponseTrait;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::all();
        return $this->successResponse(PostListResource::collection($posts), 'orders fetched successfully');
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PostRequest $request)
    {
        DB::beginTransaction();

        try {
            $data = $request->validated();
        
            if ($request->hasFile('image')) {
                $data['image'] = $request->file('image')->store('images', 'public');
            }
        
            $post = Post::create($data);
        
            if ($request->has('tags')) {
                foreach ($request->input('tags') as $userId) {
                    Tag::create([
                        'post_id' => $post->id,
                        'user_id' => $userId,
                    ]);
                }
            }
        
            DB::commit();  
        
            return $this->successResponse(new PostResource($post), 'Post created successfully');
        } catch (\Exception $e) {
            DB::rollBack();  
        
       
        
            return $this->errorResponse('Failed to create post', 500);
        }
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        
        try {
            $post = Post::with('tags.user')->findOrFail($id);
    
            return $this->successResponse(new PostResource($post), 'Post fetched successfully');
        } catch (ModelNotFoundException $e) {
            return $this->errorResponse('Post not found', 404);
        }
    }

    public function likePost(Request $request, $postId)
    {

        $checkPostExist = Post::where('id', $postId)->first();
        if (!$checkPostExist) {
            return $this->errorResponse("this post is not exist");
        }

        $userId = Auth::id();
        $checkPostLike = PostLike::where('id', $postId)->where('user_id', $userId)->first();


        if ($checkPostLike) {
            return $this->errorResponse("Already Liked the post");
        }


        PostLike::create([
            'post_id' => $checkPostExist->id,
            'user_id' => $userId,
        ]);

        return $this->successResponse(new PostResource($checkPostExist), 'Post liked successfully');
    }



    public function showLikes(Request $request, $postId)
    {

        $post = Post::find($postId);

        if (!$post) {
            return $this->errorResponse("This post does not exist");
        }

        $likes = $post->likes()->with('user')->get();

        if ($likes->isEmpty()) {
            return $this->errorResponse("No likes found");
        }

        return $this->successResponse(PostLikeResource::collection($likes), 'Post likes retrieved successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdatePostRequest $request, Post $post)
    {

        try {
            $validated = $request->validated();

            if ($request->hasFile('image')) {
                // Delete old image if it exists
                if ($post->image && Storage::exists($post->image)) {
                    Storage::delete($post->image);
                }

                $imagePath = $request->file('image')->store('images', 'public');
                $validated['image'] = $imagePath;
            }

            $post->update($validated);


            if ($request->has('tags')) {

                $post->tags()->delete();

                foreach ($request->input('tags') as $userId) {
                    Tag::create([
                        'post_id' => $post->id,
                        'user_id' => $userId,
                    ]);
                }
            }

            return $this->successResponse(new PostResource($post), 'Posts update successfully');
        } catch (Exception $e) {
            return $this->errorResponse("An error occurred: " . $e->getMessage(), 500);
        }
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Post::find($id);

        if (!$post) {
            return $this->errorResponse("Post not found");
        }


        if ($post->createdBy !== auth()->id()) {
            return $this->errorResponse("Not authorized to delete");
        }

        // Delete the post
        $post->delete();

        return $this->successResponse('', 'The post deleted');
    }
}
