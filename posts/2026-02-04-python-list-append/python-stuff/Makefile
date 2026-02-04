JSON_FILE := test.json

.PHONY: main stat hist clean

main: clean
	python -m pyperf system tune
	python list-append.py --rigorous -p 10 --min-time=0.05 -o ${JSON_FILE}

stat: main
	python -m pyperf stats ${JSON_FILE}

hist: main
	python3 -m pyperf hist ${JSON_FILE} -q

clean:
	-rm ${JSON_FILE}

