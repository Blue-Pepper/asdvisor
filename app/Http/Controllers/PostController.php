<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function createpost(Request $request)
    {
        try {
            $newPost= Post::create([
                'parent_id' => $request->input("parent_id"),
                'title' => $request->input("title"),
                'body' => $request->input("body"),
                'image_path' => $request->input("image"),
            ]);

            // Return a successful JSON response
            return response()->json([
                'success' => true,
                'message' => 'Post created successfully',
                'data' => $newPost,
            ]);
        } catch (\Exception $error) {
            // Return an error response
            return response()->json([
                'success' => false,
                'error' => 'Failed to create Post',
                'message' => $error->getMessage(),
            ], 500);
        }
    }

    public function get(){
        $posts =  Post::select("id","parent_id","title", "body", "image_path")->get();

        $posts->each(function ($post) {
            $parent = Account::find($post->parent_id);
            if ($parent) {
                $post->parentName = $parent->first_name.' '. $parent->last_name;
            }
        });

        return response()->json([
            "data" => $posts
        ]);
    }
}
