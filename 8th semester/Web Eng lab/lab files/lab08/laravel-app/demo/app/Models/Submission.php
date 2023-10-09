<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Submission extends Model
{
    public $timestamps = false;
    protected $fillable = ['name', 'email', 'message'];
    protected $table = 'registration';
}
