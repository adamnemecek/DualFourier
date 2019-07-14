module DualFourier


using DualNumbers: Dual, value, epsilon
using FFTW: fft, ifft

include("fft.jl")


export dual_fft

end # module
