"""
    Circular convolution along the dimention of n, of signals a and b.
    Slow (O(n^2)).

    Works for quaternions as well.

"""
function slow_cconv(a::AbstractArray{T}, b::AbstractArray{T}, n=nothing) where {T}
    la = last(size(a))
    lb = last(size(b))

    if isnothing(n)
        n = la + lb - 1
    end

    if la < lb
        a = [a; zeros(T, lb - la)]
    elseif lb < la
        b = [b; zeros(T, la - lb)]
    end

    N = last(size(a))
    if n < N
        an = zeros(T, n)
        bn = zeros(T, n)
        for i = 0:N - 1
            an[mod(i, n) + 1] += a[i + 1]
            bn[mod(i, n) + 1] += b[i + 1]
        end
        a = an
        b = bn
    elseif n > N
        a = [a; zeros(T, n - N)]
        b = [b; zeros(T, n - N)]
    end
    @assert last(size(a)) == last(size(b))

    res = zeros(T, size(a))

    for i in eachindex(res)
        for j in eachindex(res)
            res[i] += a[j] * b[mod(i - j, n) + 1]
        end
    end
    return res

end
