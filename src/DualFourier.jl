module DualFourier


using DualNumbers
using FFTW: fft, ifft

include("fft.jl")


export dual_fft

end # module
