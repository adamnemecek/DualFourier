
function dual_fft(f::Array{Dual})
    re = value.(f)
    du = epsilon.(f)

    fre = fft(re)
    fdu = fft(du)
    Dual.(fre, fdu)
end
