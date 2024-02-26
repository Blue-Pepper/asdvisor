<?php

namespace App\Http\Controllers;

use App\Models\Account;
use App\Models\Appointment;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AppointmentController extends Controller
{
    public function store(Request $request)
    {
        try {
            Appointment::create([
                'doctor_id' => $request->input("doctor_id"),
                'parent_id' => $request->input("parent_id"),
                'doctor_schedule_id' => $request->input("doctor_schedule_id"),
                'appointment_date' => $request->input("appointment_date"),
                'status' => $request->input("status"),
            ]);

            return response()->json([
                'success' => true,
                'message' => 'Appointment created successfully',
            ]);
        } catch (\Exception $error) {
            return response()->json([
                'success' => false,
                'error' => 'Failed to create Appointment',
                'message' => $error->getMessage(),
            ], 500);
        }
    }

    public function AllAppointments(Request $request)
    {
        $appointments = Appointment::where("parent_id", "=", $request->input("parent_id"))
            ->select("id", "doctor_id", "doctor_schedule_id", "appointment_date", "status")->orderBy("doctor_schedule_id")
            ->orderBy("appointment_date")->get();

        $appointments->each(function ($appointment) {
            $doctor = Account::find($appointment->doctor_id);
            if ($doctor) {
                $appointment->doctor_first_name = $doctor->first_name;
                $appointment->doctor_last_name = $doctor->last_name;
            }
        });

        return response()->json([
            "appointments" => $appointments
        ]);
    }


    public function AllAppointmentsDoc(Request $request)
    {
        $appointments = Appointment::where("doctor_id", "=", $request->input("doctor_id"))
            ->select("id", "parent_id", "doctor_schedule_id", "appointment_date", "status")->orderBy("doctor_schedule_id")
            ->orderBy("appointment_date")->get();

        $appointments->each(function ($appointment) {
            $parent = Account::find($appointment->parent_id);
            if ($parent) {
                $appointment->parent_first_name = $parent->first_name;
                $appointment->parent_last_name = $parent->last_name;
            }
        });

        return response()->json([
            "appointments" => $appointments
        ]);
    }

    public function firstApp(Request $request)
    {
        $today = Carbon::today()->format('Y-m-d');
        $appointment = Appointment::where("parent_id", "=", $request->input("parent_id"))
        ->where("status", "=", "confirmed")
        ->where(DB::raw("STR_TO_DATE(doctor_schedule_id, '%Y-%m-%d')"),">=", $today)
        ->select("id", "doctor_id", "doctor_schedule_id", "appointment_date", "status")
        ->orderBy("doctor_schedule_id")
        ->orderBy("appointment_date")
        ->first();

        if ($appointment) {
            $doctor = Account::find($appointment->doctor_id);
            if ($doctor) {
                $appointment->doctor_first_name = $doctor->first_name;
                $appointment->doctor_last_name = $doctor->last_name;
            }
        }

        return response()->json([
            "appointment" => $appointment
        ]);
    }


    public function firstAppDoc(Request $request)
    {
        $today = Carbon::today()->format('Y-m-d');
        $appointment = Appointment::where("doctor_id", "=", $request->input("doctor_id"))
        ->where("status", "=", "confirmed")
        ->where(DB::raw("STR_TO_DATE(doctor_schedule_id, '%Y-%m-%d')"),">=", $today)
        ->select("id", "parent_id", "doctor_schedule_id", "appointment_date", "status")
        ->orderBy("doctor_schedule_id")
        ->orderBy("appointment_date")
        ->first();

        if ($appointment) {
            $parent = Account::find($appointment->parent_id);
            if ($parent) {
                $appointment->parent_first_name = $parent->first_name;
                $appointment->parent_last_name = $parent->last_name;
            }
        }

        return response()->json([
            "appointment" => $appointment
        ]);
    }

    public function cancel(Request $request)
    {
        // Find the record by ID
        $app = Appointment::findOrFail($request->input("id"));

        // Update the status to "canceled"
        $app->status = 'canceled';
        $app->save();

        return response()->json(['message' => 'Appointment canceled successfully'], 200);
    }

    public function confirm(Request $request)
    {
        // Find the record by ID
        $app = Appointment::findOrFail($request->input("id"));

        // Update the status to "canceled"
        $app->status = 'confirmed';
        $app->save();

        return response()->json(['message' => 'Appointment Confirmed successfully'], 200);
    }


    public function countAllAppointments(Request $request)
    {
        try{
            $today = Carbon::today()->format('Y-m-d');
            $endOfWeek= Carbon::today()->endOfWeek()->format('Y-m-d');
            $count = Appointment::where("doctor_id", "=", $request->input("doctor_id"))->where(DB::raw("STR_TO_DATE(doctor_schedule_id, '%Y-%m-%d')"), $today)->count();
            $countEndOfWeek = Appointment::where("doctor_id", "=", $request->input("doctor_id"))->whereBetween(DB::raw("STR_TO_DATE(doctor_schedule_id, '%Y-%m-%d')"), [$today, $endOfWeek])->count();


            return response()->json([
                "count" => $count,
                "today" => $today,
                "endOfWeek" => $endOfWeek,
                "countEndOfWeek" => $countEndOfWeek
            ]);
        } catch (\Exception $error){
            return response()->json([
                "error" => $error
            ]);
        }

    }

}
