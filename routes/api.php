<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\PostCommentController;
use App\Http\Controllers\PostController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::post('logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

Route::middleware('auth:sanctum')->group(function () {
    
    //POST
    Route::apiResource('posts', PostController::class);
    Route::delete('/posts/{id}', [PostController::class, 'destroy']);

    //likes
    Route::post('/posts/{id}/like', [PostController::class, 'likePost']);
    Route::get('/posts/{id}/showLikes', [PostController::class, 'showLikes']);

    

    //comments
    Route::post('/posts/{id}/comment', [PostCommentController::class, 'commentPost']);
    Route::get('/posts/{id}/showComments', [PostCommentController::class, 'showComments']);
    Route::get('/comments/{id}', [PostCommentController::class, 'showCommentsDetails']);

    Route::post('/comment/{id}/likeComment', [PostCommentController::class, 'likeComment']);
    Route::post('/comment/{id}/replyComment', [PostCommentController::class, 'replyComment']);

    
});
