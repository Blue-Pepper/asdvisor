<?php

namespace App\Http\Controllers;

use App\Models\ChildProfile;
use Illuminate\Http\Request;

class ChildProfileController extends Controller
{
    public function store(Request $request)
    {
        try {
            $newChildProfile = ChildProfile::create([
                'first_name' => $request->input("first_name"),
                'last_name' => $request->input("last_name"),
                'birthdate' => $request->input("birthdate"),
                'height' => $request->input("height"),
                'weight' => $request->input("weight"),
                'gender' => $request->input("gender"),
                'age' => $request->input("age"),
                "account_id" => $request->input("account_id"),
            ]);

            // Return a successful JSON response
            return response()->json([
                'success' => true,
                'message' => 'Child profile created successfully',
                'data' => $newChildProfile,
            ]);
        } catch (\Exception $error) {
            // Return an error response
            return response()->json([
                'success' => false,
                'error' => 'Failed to create child profile',
                'message' => $error->getMessage(),
            ], 500);
        }
    }

    public function get(Request $request)
    {
        try {
            $childRecords = ChildProfile::where('account_id', '=', $request->input('account_id'))->get();
            // Return a successful JSON response
            return response()->json([
                'success' => true,
                'message' => 'Child profile created successfully',
                'data' => $childRecords,
            ]);
        } catch (\Exception $error) {
            // Return an error response
            return response()->json([
                'success' => false,
                'error' => 'Failed to create child profile',
                'message' => $error->getMessage(),
            ], 500);
        }
    }

    public function getAll()
    {
        try {
            $childRecords = ChildProfile::all();
            return response()->json([
                'success' => true,
                'message' => 'Child profile created successfully',
                'data' => $childRecords,
            ]);
        } catch (\Exception $error) {
            // Return an error response
            return response()->json([
                'success' => false,
                'error' => 'Failed to create child profile',
                'message' => $error->getMessage(),
            ], 500);
        }
    }
}
