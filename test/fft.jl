
module TestFFT
using FFTW: fft
using Signal: slow_cconv
using DualFourier: dual_fft

@testset "convolution theorem" begin
    a = rand(ComplexF64)
    b = rand(ComplexF64)
    @test fft(a) .* fft(b) ≈ fft(slow_cconv(a,b))
end
end
