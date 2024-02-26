<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\DailyCare>
 */
class DailyCareFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'doctor_id' => "2",
            'title' => fake()->sentence(1),
            'body' => fake()->paragraph(5),
            'image' => "default-image",
            'deleted_at' => NULL
        ];
    }
}
