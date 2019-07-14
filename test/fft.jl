
module TestFFT
using FFTW: fft
using Signal: slow_cconv
using DualFourier: dual_fft
using DualNumbers: Dual, value, epsilon
using Test: @test, @testset


@testset "complex convolution theorem" begin
    a = rand(ComplexF64, 10)
    b = rand(ComplexF64, 10)
    @test fft(a) .* fft(b) ≈ fft(slow_cconv(a,b, length(a)))
end
isapprox(a::Dual, b::Dual) = value(a) ≈ value(b) && epsilon(a) ≈ epsilon(b)

@testset "dual convolution theorem" begin
    are = rand(Float64, 10)
    adu = rand(Float64, 10)

    bre = rand(Float64, 10)
    bdu = rand(Float64, 10)

    a = Dual.(are, adu)
    b = Dual.(bre, bdu)

    res = dual_fft(a) .* dual_fft(b)
    exp = dual_fft(slow_cconv(a,b, length(a)))
    # println(res)
    # println(exp)
    @test res ≈ exp

end
end
