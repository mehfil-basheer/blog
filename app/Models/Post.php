<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use HasFactory;

    protected $fillable = [
        'title', 
        'description', 
        'image', 
        'createdBy'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'createdBy');
    }

    public function tags()
    {
        return $this->hasMany(Tag::class);
    }

    public function totalLikes()
        {
            return $this->likes()->count();
        }
        
    public function likes()
    {
        return $this->hasMany(PostLike::class);
    }

    public function totalComments(){
        return $this->comments()->count();
    }

    public function totalTags(){
        return $this->tags()->count();
    }

    public function comments()
    {
        return $this->hasMany(PostComment::class);
    }
}
