import math


def media(lst):
    m = 0
    for l1 in lst:
        m += l1
    return m / len(lst)


def variancia(media, lst):
    r = 0
    for l1 in lst:
        r += (l1 - media) ** 2
    return r / len(lst)


def desvio_padrao(variancia):
    return math.sqrt(variancia)


hs = [7, 8, 6, 0, 7, 7, 10]

print(f"media: {media(hs)}")
print(f"variancia: {variancia(media(hs), hs)}")
print(f"desvio padrão: {desvio_padrao(variancia(media(hs), hs))}")
