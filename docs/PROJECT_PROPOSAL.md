# MoonFlags 项目申报书

## 基本信息

- 项目名称：MoonFlags：MoonBit 原生功能开关与灰度分流库
- 参赛者：季心慧
- 联系方式：16630827097
- GitHub 账号：WhisperJXH
- GitHub 仓库链接：https://github.com/WhisperJXH/moonflags
- Mooncakes 包名：WhisperJXH/moonflags
- 项目方向：原创 MoonBit 开源库
- 是否为移植项目：否，原创 MoonBit 实现
- 开源许可证：Apache-2.0

## 项目简介

MoonFlags 是一个 MoonBit 原生的功能开关、用户分群、灰度分流和配置校验库。它解决 MoonBit / WebAssembly 应用在发布新功能时缺少可复用 feature flag 基础库的问题，使开发者可以按用户属性、名单、命名分群和百分比稳定分流来决定功能变体，并获得可解释的评估结果。

## 项目方向与适用场景

项目适用于 MoonBit 应用、WASM 边缘逻辑、示例服务、前端编译目标和需要本地规则判定的工具。典型场景包括：灰度发布、A/B 测试、按地区或用户角色开放能力、边缘配置判定、离线规则验证和测试环境开关管理。

MoonFlags 的边界是小型、纯 API 驱动的本地规则模型，重点放在 segment 复用、确定性分桶、可解释评估结果和配置诊断。项目不内置远程控制面、持久化同步或 JSON/YAML 配置加载层，便于作为更高层配置系统的嵌入式规则评估与校验组件。

## 已完成的核心功能

- `Context` 属性模型：支持字符串、整数、布尔值和字符串列表。
- `Condition` 规则匹配：支持存在、缺失、等值、不等、集合命中、字符串包含、前后缀和整数比较。
- `Segment` 用户分群：支持 include/exclude 用户名单和可复用属性条件。
- `Rule` / `Flag` 评估引擎：按顺序命中规则，返回变体、原因、规则 key、桶号和警告。
- `Rollout` 稳定分流：使用 0 到 10000 基点的确定性哈希桶完成百分比分流。
- `validate_flag` / `validate_set`：检查重复变体、未知 segment、无效变体和 rollout 权重问题。
- `preset_catalog_*` 场景预设：提供 175 个常见业务 feature flag 模板，覆盖多国家、多套餐、多角色、多年龄门槛和不同比例 rollout，可用于项目初始化、示例演示和批量回归测试。
- 提供 README、可运行示例、测试、CI、开源许可证和 Mooncakes 发布配置。

## 完成情况与验收证据

当前仓库已经完成标准 MoonBit 包结构、核心数据模型、条件匹配、稳定分流、FlagSet 评估、配置校验、黑盒/白盒测试、可运行示例、GitHub Actions CI、版本标签和 Mooncakes 发布。`preset_catalog_*` 强类型场景预设目录已经把常见业务开关配置沉淀为可编译、可测试、可校验的 MoonBit API 模板，既可作为接入样例，也可作为规则引擎的批量回归用例。

项目已通过 `moon check`、`moon build`、`moon test`、`moon run cmd/main`、`moon package`、`moon check --deny-warn`、`moon test --deny-warn` 和 `moon fmt --check`。当前测试结果为 13 项全部通过，有效 MoonBit 源码 7223 行，Mooncakes 最新发布版本构建状态为 success。

## 原创或参考说明

本项目为原创 MoonBit 开源库，不移植第三方源码，不包含来源不明素材、私有代码或商业代码。项目只使用 MoonBit 标准工具链和核心库，采用 Apache-2.0 许可证发布。
