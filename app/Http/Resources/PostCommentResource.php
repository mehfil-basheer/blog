<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PostCommentResource extends JsonResource
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
            'user_id' => $this->user->id,
            'comment' => $this->comments,
            'username' => $this->user->name,
            'comment_time' => $this->created_at->format('Y-m-d H:i:s'),
            'totalLikes' => $this->totalLikes(),
            'totalReplies' => $this->totalReplies()
        ];
    }
}
