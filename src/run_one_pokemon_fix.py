import json
import re
from pathlib import Path

repo_root = Path(__file__).resolve().parents[1]
nb_path = repo_root / 'src' / 'fetch_learn_v1.ipynb'
nb = json.loads(nb_path.read_text(encoding='utf-8'))

code_lines = []
for cell in nb.get('cells', []):
    if cell.get('cell_type') == 'code':
        src = cell.get('source', [])
        if isinstance(src, str):
            src_lines = src.splitlines()
        else:
            src_lines = []
            for s in src:
                src_lines.extend(s.splitlines())
        for line in src_lines:
            if re.match(r'^\s*main\(\)\s*$', line):
                continue
            code_lines.append(line)

code = '\n'.join(code_lines)

g = {}
exec(code, g)

# override CSV paths to use repo data folder
g['POKEMON_CSV'] = repo_root / 'data' / 'pokemon151_v3.csv'
# some repos use move.csv vs move_gen9; use move.csv as in notebook
g['MOVE_CSV'] = repo_root / 'data' / 'move.csv'

pokemon_rows = g['load_csv'](g['POKEMON_CSV'])
move_rows = g['load_csv'](g['MOVE_CSV'])
move_lookup = g['build_move_lookup'](move_rows)

# find pokemon with pokemon_id == '26'
target = None
for p in pokemon_rows:
    if str(p.get('pokemon_id', '')).strip() == '26':
        target = p
        break

if target is None:
    print('Pokemon id 26 not found in', g['POKEMON_CSV'])
else:
    print('Running parse_learn_page for', target.get('name_en'), '(pokemon_id=26)')
    rows = g['parse_learn_page'](target, move_lookup)
    print(f'Parsed {len(rows)} learn rows for {target.get("name_en")}')
    for i, r in enumerate(rows[:200], 1):
        print(i, r)
    if len(rows) > 200:
        print('... (truncated)')
