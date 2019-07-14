
module TestFFT
using FFTW: fft
using Signal: slow_cconv
using DualFourier: dual_fft
using Test: @test, @testset

@testset "convolution theorem" begin
    a = rand(ComplexF64, 10)
    b = rand(ComplexF64, 10)
    @test fft(a) .* fft(b) ≈ fft(slow_cconv(a,b, length(a)))
end
end
