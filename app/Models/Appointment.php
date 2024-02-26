<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Account;

class Appointment extends Model
{
    use HasFactory;
    protected $table = "appointments";
    protected $guarded = [];

    public function account()
    {
        return $this->belongsTo(Account::class);
    }
}
