<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\Guard;

class PostComment extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function post()
    {
        return $this->belongsTo(Post::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function likes(){
        return $this->hasMany(PostCommentLike::class, 'comment_id', 'id');
    }

    public function totalLikes(){
        return $this->likes()->count();
    }

    public function commentReplies(){
        return $this->hasMany(PostCommentReply::class, 'comment_id', 'id');
    }

    public function totalReplies(){
        return $this->commentReplies()->count();
    }
}
