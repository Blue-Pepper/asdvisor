<?php

namespace App\Http\Controllers;

use App\Models\Account;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;


class AccountController extends Controller
{
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|unique:accounts,email',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        try {
            $newAccount = Account::create([
                'first_name' => $request->input("first_name"),
                'last_name' => $request->input("last_name"),
                'birthdate' => $request->input("birthdate"),
                'email' => $request->input("email"),
                'contact' => $request->input("contact"),
                'gender' => $request->input("gender"),
                'password' => bcrypt($request->input("password")),
                "account_level" => "Parents",
                "remember_token" => "NULL",
            ]);

            $responseId =  Account::where('email', '=', $newAccount->email)
                ->select("id")->first();

            $responseData = [
                "id" => $responseId->id,
                'first_name' => $newAccount->first_name,
                'last_name' => $newAccount->last_name,
                'birthdate' => $newAccount->birthdate,
                'email' => $newAccount->email,
                'contact' => $newAccount->contact,
                'gender' => $newAccount->gender,
            ];


            // Return a successful JSON response
            return response()->json([
                'success' => true,
                'message' => 'Account created successfully',
                'tokenData' => "",
                'data' => $responseData,
            ]);
        } catch (\Exception $error) {
            // Return an error response
            return response()->json([
                'success' => false,
                'error' => 'Failed to create account',
                'message' => $error->getMessage(),
            ], 500);
        }
    }

    public function get(Request $request)
    {
        $token = Str::random(32);
        try {
            $columns = Account::where('email', '=', $request->input('email'))
                ->select("id", "first_name", "last_name", "contact", "email", "birthdate", "password", "account_level")->first();

            if (Hash::check($request->input('password'), $columns->password)) {
                return response()->json([
                    'success' => true,
                    'message' => 'Login successfully',
                    'tokenData' => $token,
                    'data' => $columns
                ]);
            } else {
                return response()->json(['error' => ["Email or Password is incorrect!"]], 400);
            }
        } catch (\Exception $error) {
            return response()->json([
                'success' => false,
                'error' => ["Email or Password is incorrect!"],
                'message' => $error->getMessage(),
            ], 500);
        }
    }

    public function getDoctors()
    {
        $doctors = Account::where("account_level", "=", "Doctor")
            ->select("id", "first_name", "last_name", "contact", "email", "birthdate")->get();;

        return response()->json([
            "doctors" => $doctors,
        ]);
    }
}
