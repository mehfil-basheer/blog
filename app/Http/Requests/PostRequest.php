<?php

namespace App\Http\Requests;

use App\Traits\ValidationResponse;
use Illuminate\Foundation\Http\FormRequest;

class PostRequest extends FormRequest
{
    use ValidationResponse;
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'createdBy' => 'required|exists:users,id',
        ];
    }
}
