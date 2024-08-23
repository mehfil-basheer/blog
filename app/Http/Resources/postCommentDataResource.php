<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class postCommentDataResource extends JsonResource
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
            'totalReplies' => $this->totalReplies(),

            'likes'  => $this->likes->map(function ($likes) {
                return [
                    'id' => $likes->id,
                    'user_id' => $likes->user->id,
                    'username' => $likes->user->name,
                    'liked_time' => $likes->created_at->format('Y-m-d H:i:s'),
                ];
            }),
            'replies' => $this->commentReplies->map(function ($replies) {
                return [
                    'id' => $replies->id,
                    'reply' => $replies->comments,
                    'user_id' => $replies->user->id,
                    'username' => $replies->user->name,
                    'liked_time' => $replies->created_at->format('Y-m-d H:i:s'),
                ];
            }),


        ];
    }
}
