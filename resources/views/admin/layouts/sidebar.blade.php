<div class="sidebar" id="sidebar">
    <a href="{{ route('admin.dashboard') }}" class="py-2 text-center brand-link fs-4 d-block">Plantopia</a>
    <nav>
        <ul>
            <li><a href="{{ route('admin.dashboard') }}"><i class="nav-icon fas fa-tachometer-alt"></i>Dashboard</a></li>
            <li><a href="{{ route('category.list') }}"><i class="nav-icon fas fa-file-alt"></i> Category</a></li>
            <li><a href="{{ route('product.list') }}"><i class="nav-icon fas fa-tag"></i> Products</a></li>
            <li><a href="{{ route('shipping.list') }}"><i class="nav-icon fa-solid fa-truck-fast"></i> Shippings</a></li>
            <li><a href="{{ route('order.list') }}"><i class="nav-icon fas fa-shopping-bag"></i> Orders</a></li>
        </ul>
    </nav>
</div>
