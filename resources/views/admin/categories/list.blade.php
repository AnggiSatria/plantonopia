@extends('admin.layouts.app')

@section('content')
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="mb-4 col-lg-4">
                <div class="card">
                    <form action="{{ isset($category) ? route('category.update', $category->id) : route('category.store') }}"
                        method="post">
                        @csrf

                        @if (isset($category))
                            @method('PUT')
                        @endif

                        <div class="py-3 mb-3 card-header">
                            <h5 class="mb-0">{{ isset($category) ? 'Edit Category' : 'Create Category' }}</h5>
                        </div>
                        <div class="mx-3 mb-2">
                            <label for="name" class="m-0 form-label">Name</label>
                            <input type="text" name="name" id="name"
                                class="form-control @error('name') is-invalid @enderror" placeholder="Hidroponik"
                                value="{{ old('name', $category->name ?? '') }}">
                            @error('name')
                                <div class="invalid-feedback">
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="m-3">
                            <button type="submit" class="btn btn-primary">Save</button>
                            <a href="{{ route('category.list') }}" class="btn btn-danger">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>

            <div class="mb-4 col-lg-8">
                <div class="mb-4 card">
                    <div class="py-3 card-header">
                        <h5 class="mb-0">Categories</h5>
                    </div>
                    <div class="card-body">
                        <table class="table mb-4">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col" class="pe-5">Name</th>
                                    <th scope="col">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                @forelse ($categories as $category)
                                    <tr>
                                        <th scope="row">{{ $category->id }}</th>
                                        <td class="pe-5">{{ $category->name }}</td>
                                        <td>
                                            <form onsubmit="return confirm('Are you sure?');"
                                                action="{{ route('category.destroy', $category->id) }}" method="POST">
                                                @csrf
                                                <a href="{{ route('category.edit', $category->id) }}"
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
                                        <td colspan="3">
                                            <div class="text-center alert alert-danger">
                                                Data Categories not yet available.
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
