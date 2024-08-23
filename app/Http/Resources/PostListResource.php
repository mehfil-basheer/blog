<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PostListResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'description' => $this->description,
            'image' => $this->image,
            'user_id' => $this->createdBy,
            'created_at' => $this->created_at->format('Y-m-d H:i:s'),
            'total_likes' => $this->totalLikes(), 
            'total_comments' => $this->totalComments(), 
            'total_tags' => $this->totalTags(), 
            'username' => $this->user ? $this->user->name : null,
        
        ];
    }
}
