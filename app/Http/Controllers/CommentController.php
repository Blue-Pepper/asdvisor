<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function getComments(Request $request)
    {

        try {
            $comments = Comment::select("parent_id", "body")->where("post_id", $request->input('post_id'))->orderBy("created_at", 'desc')->get();

            $comments->each(function ($comment) {
                $parent = Account::find($comment->parent_id);
                if ($parent) {
                    $comment->parentName = $parent->first_name . ' ' . $parent->last_name;
                }
            });
            return response()->json([
                "data" => $comments
            ]);
        } catch (\Exception $error) {
            return response()->json([
                'success' => false,
                'error' => 'Failed to add comment',
                'message' => $error->getMessage(),
            ], 500);
        }
    }

    public function storeComment(Request $request)
    {
        try {
            $newComment = Comment::create([
                'parent_id' => $request->input("parent_id"),
                'post_id' => $request->input("post_id"),
                'body' => $request->input("body"),
            ]);



            return response()->json([
                'success' => true,
                'message' => 'Comment added successfully',
                'data' => $newComment,
            ]);
        } catch (\Exception $error) {
            return response()->json([
                'success' => false,
                'error' => 'Failed to add comment',
                'message' => $error->getMessage(),
            ], 500);
        }
    }
}
