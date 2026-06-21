# pokemon-gen1-move-db

这是一个大数据与数据工程的课程项目，面向初代151只宝可梦（Generation I），用于收集、清洗、建模并分析宝可梦在最新世代与招式（move）之间的学习关系。

仓库结构：

- data/
	- raw/           原始抓取/收集的多版本 CSV/JSON 文件（如 pokemon151_v*.csv, move_v*.json, 
	- processed/     清洗后可直接用于分析的 CSV（`pokemon.csv`, `move.csv`, `learn.csv`）
- docs/
	- report.md      项目报告，包含背景、目标、数据库设计、ETL 流程与示例查询
- src/             数据抓取与清洗的 Notebook（`fetch_*`、`data_cleaning_v*.ipynb`）
- sql/
	- database_creating.sql  建表与索引脚本
    - data_visualization.ipynb 数据查询与可视化的 Notebook
- img/             可视化图表

目前实现的功能：

- 原始数据收集：将来自不同版本与来源的宝可梦/招式/学习关系数据保存在 `data/raw/`；
- 数据清洗与合并：通过 `src/` 下的 Notebook 将原始数据标准化并产出 `data/processed/*.csv`；
- 关系型建模：提供 `sql/database_creating.sql`，包含 `pokemon`、`move`、`learn` 等表的建表语句与索引建议；
- 报告文档：在 `docs/report.md` 中汇总了项目背景、设计与若干 SQL 查询示例；
- 分析与可视化示例：`data_visualization.ipynb` 演示了基于处理后数据的图表生成流程。

如何使用：

1. 查看并运行 `src/fetch_*`（以最新的版本为准）爬取原始数据，运行 `src/data_cleaning_v1` 以重现数据清洗流程；
2. 在MySQL里运行 `sql/database_creating.sql` 创建数据表，运行 `sql/database_creating.sql` 将数据导入目标数据库（域名需替换为自己的）；
3. 在 `sql/data_visualization.ipynb` 中修改域名后运行 Notebook 进行可视化，或在数据库中运行对应的 SQL 以获取分析结果