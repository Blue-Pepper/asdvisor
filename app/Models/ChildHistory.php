<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChildHistory extends Model
{
    use HasFactory;
    protected $table = 'child_history';
    protected $guarded = [];
}
