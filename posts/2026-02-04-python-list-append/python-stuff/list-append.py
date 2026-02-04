listlaenge= 1_000_000

def test():
    # Zunächst erzeugen wir eine Liste
    grundliste = list(range(listlaenge))
    
    # Eine Funktion, die ein Element verarbeitet
    def process(x):
        return x * 2
      
    # Wir fügen der Liste ein neues Element hinzu
    neueliste = []
    
    for item in grundliste:
        neueliste.append(process(item))

def test2():
    # Zunächst erzeugen wir eine Liste
    grundliste = list(range(listlaenge))
    
    # Eine Funktion, die ein Element verarbeitet
    def process(x):
        return x * 2
      
    # Wir fügen der Liste ein neues Element hinzu
    neueliste = [0] * len(grundliste)
    
    for pos, item in enumerate(grundliste):
        neueliste[pos] = process(item)

def test3():
    # Zunächst erzeugen wir eine Liste
    grundliste = list(range(listlaenge))
    
    # Eine Funktion, die ein Element verarbeitet
    def process(x):
        return x * 2
      
    # Wir fügen der Liste ein neues Element hinzu
    neueliste = [process(x) for x in grundliste]


if __name__ == '__main__':
    import pyperf
    
    runner = pyperf.Runner()
    runner.parse_args()
    for func in (test, test2, test3):
        runner.bench_func(func.__name__, func)
