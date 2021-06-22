def comon(a, b):
	n = a * b
	while b > 0:
		temp = a % b
		a = b
		b = temp
	return int(n / a)

def search(mi, ma, a, b, c, n):
	if mi >= ma:
		return mi
	mid = int((mi + ma) / 2)

	ab = comon(a, b)
	ac = comon(a, c)
	bc = comon(b, c)
	abc = comon(a, bc)

	res = int(mid / a) + int(mid / b) + int(mid / c) - int(mid / ab) - int(mid / ac) - int(mid / bc) + int(mid / abc)
	if res == n:
		return mid
	if res < n:
		return search(mid + 1, ma, a, b, c, n)
	else:
		return search(mi, mid - 1, a, b, c, n)

def func(a, b, c, n):
	mi = min(a, b, c)
	ma = mi * n
	res = search(mi, ma, a, b, c, n)
	la = res % a
	lb = res % b
	lc = res % c
	return res - min(la ,lb ,lc)

print(func(2, 3, 5, 7))