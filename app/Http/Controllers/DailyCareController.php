<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\DailyCare;

class DailyCareController extends Controller
{
    public function get(){
        $daily_cares =  DailyCare::select("id","title", "body", "image")->get();

        return response()->json([
            "data" => $daily_cares
        ]);
    }

    public function gettwo(){
        $daily_cares =  DailyCare::select("id","title", "body", "image")->take(2)->get();

        return response()->json([
            "data" => $daily_cares
        ]);
    }

    public function createguide(Request $request)
    {
        try {
            $newDailyCare= DailyCare::create([
                'doctor_id' => $request->input("doctor_id"),
                'title' => $request->input("title"),
                'body' => $request->input("body"),
                'image' => $request->input("image"),
            ]);

            // Return a successful JSON response
            return response()->json([
                'success' => true,
                'message' => 'Daily Care created successfully',
                'data' => $newDailyCare,
            ]);
        } catch (\Exception $error) {
            // Return an error response
            return response()->json([
                'success' => false,
                'error' => 'Failed to create Daily Care',
                'message' => $error->getMessage(),
            ], 500);
        }
    }
}
