<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Shipping;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class ShippingController extends Controller
{
    public function index()
    {
        $shippings = Shipping::all();

        return view('admin.shipping.list', compact('shippings'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'type' => 'required|min:3|regex:/^[a-zA-Z\s]+$/u|unique:shippings,type',
            'price' => 'required|numeric'
        ]);

        Shipping::create([
            'type' => $request->type,
            'price' => $request->price,
        ]);

        return redirect()->route('shipping.list')->with('success', 'Shipping created successfully.');
    }

    public function edit($id)
    {
        $shipping = Shipping::findOrFail($id);
        $shippings = Shipping::all();

        return view('admin.shipping.list', compact('shipping', 'shippings'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'type' => [
                'required',
                'regex:/^[a-zA-Z\s]+$/u',
                'min:3',
                Rule::unique('shippings', 'type')->ignore($id),
            ],
            'price' => 'required|numeric'
        ]);

        $shipping = Shipping::findOrFail($id);

        $shipping->update([
            'type' => $request->type,
            'price' => $request->price,
        ]);

        return redirect()->route('shipping.list')->with('success', 'Shipping updated successfully.');
    }

    public function destroy($id)
    {
        $shipping = Shipping::findOrFail($id);

        $shipping->delete();

        return redirect()->route('shipping.list')->with(['success' => 'Shipping deleted successfully!']);
    }
}
