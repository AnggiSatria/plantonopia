@extends('admin.layouts.app')

@section('content')
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="mb-4 col-lg-4">
                <div class="card">
                    <form action="{{ isset($shipping) ? route('shipping.update', $shipping->id) : route('shipping.store') }}"
                        method="post">
                        @csrf

                        @if (isset($shipping))
                            @method('PUT')
                        @endif

                        <div class="py-3 mb-3 card-header">
                            <h5 class="mb-0">{{ isset($shipping) ? 'Edit Shipping' : 'Create Shipping' }}</h5>
                        </div>

                        <div class="mx-3 mb-2">
                            <label for="type" class="m-0 form-label">Type</label>
                            <input type="text" name="type" id="type"
                                class="form-control @error('type') is-invalid @enderror" placeholder="Same Day"
                                value="{{ old('type', $shipping->type ?? '') }}">
                            @error('type')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>

                        <div class="mx-3 mb-2">
                            <label for="price" class="m-0 form-label">Price</label>
                            <input type="text" name="price" id="price"
                                class="form-control @error('price') is-invalid @enderror" placeholder="5000"
                                value="{{ old('price', $shipping->price ?? '') }}">
                            @error('price')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>

                        <div class="m-3">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <a href="{{ route('shipping.list') }}" class="btn btn-danger">Cancel</a>
                        </div>

                    </form>
                </div>
            </div>

            <div class="mb-4 col-lg-8">
                <div class="mb-4 card">
                    <div class="py-3 card-header">
                        <h5 class="mb-0">Shippings</h5>
                    </div>
                    <div class="card-body">
                        <table class="table mb-4">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col" class="pe-5">Name</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($shippings as $shipping)
                                    <tr>
                                        <th scope="row">{{ $shipping->id }}</th>
                                        <td class="pe-5">{{ $shipping->type }}</td>
                                        <td>{{ 'Rp ' . number_format($shipping->price, 2, ',', '.') }}</td>
                                        <td>
                                            <form onsubmit="return confirm('Are you sure?');"
                                                action="{{ route('shipping.destroy', $shipping->id) }}" method="POST">
                                                @csrf
                                                <a href="{{ route('shipping.edit', $shipping->id) }}"
                                                    class="btn btn-success">
                                                    Edit
                                                </a>
                                                @method('DELETE')
                                                <button class="btn btn-danger" type="submit">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                @empty
                                    <tr>
                                        <td colspan="4">
                                            <div class="text-center alert alert-danger">
                                                Data Shipping not yet available.
                                            </div>
                                        </td>
                                    </tr>
                                @endforelse
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('customJs')
    <script>
        @if (session('success'))
            Swal.fire({
                icon: "success",
                title: "Success",
                text: "{{ session('success') }}",
                showConfirmButton: false,
                timer: 2000
            });
        @elseif (session('error'))
            Swal.fire({
                icon: "error",
                title: "Fail!",
                text: "{{ session('error') }}",
                showConfirmButton: false,
                timer: 2000
            });
        @endif
    </script>
@endsection
