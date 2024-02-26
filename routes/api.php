<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//account
Route::post('/account', 'App\Http\Controllers\AccountController@store');
Route::post('/login', 'App\Http\Controllers\AccountController@get');
Route::get('/getDoctors', 'App\Http\Controllers\AccountController@getDoctors');

//childprofile
Route::post('/childprofile', 'App\Http\Controllers\ChildProfileController@store');
Route::post('/getchildprofile', 'App\Http\Controllers\ChildProfileController@get');
Route::get('/getAllChildProfile','App\Http\Controllers\ChildProfileController@getAll');


//appointment
Route::post('/appointments/store', 'App\Http\Controllers\AppointmentController@store');
Route::post('/appointments/getAllApp', 'App\Http\Controllers\AppointmentController@AllAppointments');
Route::post('/appointments/getFirstApp', 'App\Http\Controllers\AppointmentController@firstApp');

//appointmentdoctor
Route::post('/appointments/getFirstAppDoc', 'App\Http\Controllers\AppointmentController@firstAppDoc');
Route::post('/appointments/getAllAppDoc', 'App\Http\Controllers\AppointmentController@AllAppointmentsDoc');
Route::post('/appointments/cancelAppDoc', 'App\Http\Controllers\AppointmentController@cancel');
Route::post('/appointments/confirmAppDoc', 'App\Http\Controllers\AppointmentController@confirm');
Route::post('/appointments/countDoc', 'App\Http\Controllers\AppointmentController@countAllAppointments');


//dailycare
Route::get('/dailycare', 'App\Http\Controllers\DailyCareController@get');
Route::get('/dailycaretwo', 'App\Http\Controllers\DailyCareController@gettwo');
Route::post('/dailycareguide', 'App\Http\Controllers\DailyCareController@createguide');

//posts
Route::post('/createpost', 'App\Http\Controllers\PostController@createpost');
Route::get('/posts', 'App\Http\Controllers\PostController@get');


//comments
Route::post('/getComments', 'App\Http\Controllers\CommentController@getComments');
Route::post('/storeComment', 'App\Http\Controllers\CommentController@storeComment');


//childhistory
Route::post('/childHistoryCreate', 'App\Http\Controllers\ChildHistoryController@store');
Route::post('/childHistoryGet', 'App\Http\Controllers\ChildHistoryController@get');
