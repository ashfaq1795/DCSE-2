<?php

namespace App\Http\Controllers;

use App\Models\Submission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class FormController extends Controller
{
    // ...
    public function showForm()
    {
        return view('form');
    }
    
    public function submitForm(Request $request)
    {
        // Validate the form data
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:255',
            'email' => 'required|email|max:255',
            'message' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect('/form')
                ->withErrors($validator)
                ->withInput();
        }

        // Create a new submission record
        $submission = new Submission();
        $submission->name = $request->input('name');
        $submission->email = $request->input('email');
        $submission->message = $request->input('message');
        $submission->save();

        return redirect('/form')->with('success', 'Form submitted successfully!');
    }

    // ...
}
