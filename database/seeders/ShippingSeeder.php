<?php

namespace Database\Seeders;

use App\Models\Shipping;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ShippingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Shipping::factory()->create([
            'type' => 'Regular',
            'price' => 12000
        ]);

        Shipping::factory()->create([
            'type' => 'Same Day',
            'price' => 30000
        ]);

        Shipping::factory()->create([
            'type' => 'Economy',
            'price' => 7500
        ]);
    }
}
