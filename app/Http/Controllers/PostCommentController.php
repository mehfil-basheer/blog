<?php

namespace App\Http\Controllers;

use App\Http\Resources\postCommentDataResource;
use App\Http\Resources\PostCommentResource;
use App\Http\Resources\PostResource;
use App\Models\Post;
use App\Models\PostComment;
use App\Models\PostCommentLike;
use App\Models\PostCommentLikes;
use App\Models\PostCommentReply;
use App\Traits\ApiResponseTrait;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class PostCommentController extends Controller
{
    use ApiResponseTrait;
   
    public function commentPost(Request $request,$postId){

        $checkPostExist=Post::where('id',$postId)->first();
        if(!$checkPostExist){
           return $this->errorResponse("this post is not exist");
        }

        $userId = Auth::id(); 
       

        PostComment::create([
            'post_id' => $checkPostExist->id,
            'comments'=>$request->comment,
            'user_id' => $userId,
        ]);
    
        return $this->successResponse(new PostResource($checkPostExist), 'Post commented successfully');
    }
    public function showComments(Request $request,$postId){

        $post = Post::find($postId);

        if (!$post) {
            return $this->errorResponse("This post does not exist");
        }

        $comments = $post->comments()->with('user')->get();

        if ($comments->isEmpty()) {
            return $this->errorResponse("No likes found");
        }

        return $this->successResponse(PostCommentResource::collection($comments), 'Post comments fetched successfully');
    }

    public function likeComment(Request $request,$commentId){
       
        $comment = PostComment::find($commentId);

        
        if (!$comment) {
            return $this->errorResponse("This comment does not exist");
        }

        $userId = Auth::id(); 
        

        PostCommentLike::create([
            'comment_id' => $comment->id,
            'user_id' => $userId,
        ]);

      

        return $this->successResponse('', 'Post comments liked successfully');
        
    }

    public function replyComment(Request $request,$commentId){
       
        $comment = PostComment::find($commentId);

        
        if (!$comment) {
            return $this->errorResponse("This comment does not exist");
        }

        $userId = Auth::id(); 
        

        PostCommentReply::create([
            'comment_id' => $comment->id,
            'user_id' => $userId,
            'comments'=>$request->reply
        ]);

      

        return $this->successResponse('', 'Post comments replied successfully');
        
    }

    public function showCommentsDetails($id){
        
        $comment = PostComment::findOrFail($id);
        return $this->successResponse(new postCommentDataResource($comment), 'Post fetched successfully');
        
    }

    
}


