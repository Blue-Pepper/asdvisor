<?php

namespace App\Http\Controllers;

use App\Models\ChildHistory;
use Illuminate\Http\Request;


class ChildHistoryController extends Controller
{
    public function store(Request $request)
    {
        try {
            $newChildHistory = ChildHistory::create([
                'child_id' => $request->input("child_id"),
                'parent_id' => $request->input("parent_id"),
                'description' => $request->input("description"),
                'category' => $request->input("category"),
                'date' => $request->input("date"),
                'image' => $request->input("image"),
            ]);

            // Return a successful JSON response
            return response()->json([
                'success' => true,
                'message' => 'Child History created successfully',
                'data' => $newChildHistory,
            ]);
        } catch (\Exception $error) {
            // Return an error response
            return response()->json([
                'success' => false,
                'error' => 'Failed to create Child History',
                'message' => $error->getMessage(),
            ], 500);
        }
    }

    public function get(Request $request)
    {
        $childHistories = ChildHistory::select("id", "category", "description", "date" )->where("child_id", $request->input("child_id"))->get();

        return response()->json([
            'success' => true,
            'child_histories' => $childHistories
        ]);
    }
}
