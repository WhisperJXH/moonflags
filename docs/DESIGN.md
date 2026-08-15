# MoonFlags 设计说明

## 目标

MoonFlags 的目标是在 MoonBit 生态中提供一个可复用、可测试、可解释的功能开关基础库。项目避免绑定具体网络、存储或配置中心，核心功能保持纯 MoonBit 实现，便于在 wasm、wasm-gc、js 和 native 目标中复用。

## 生态去重

通过 mooncakes.io 模块清单检索 `feature`、`flag`、`toggle`、`rollout`、`targeting`、`segment`、`experiment` 等关键词后，确认 MoonBit 生态中已经存在同方向的功能开关与灰度发布项目。MoonFlags 因此将边界收窄为一个小型、纯 API 驱动的本地规则模型：强调 segment 复用、确定性分桶、可解释评估结果和配置诊断，不内置远程控制面、持久化同步或 JSON/YAML 配置加载层。这个定位使它更适合作为 MoonBit / WebAssembly 应用中的轻量嵌入式判定核心，或者作为更高层配置系统的规则评估与校验组件。

## 模块结构

- `types.mbt`：公开数据模型，包括 `Attribute`、`Condition`、`Segment`、`Rule`、`Rollout`、`Flag`、`FlagSet`、`Evaluation` 和 `Diagnostic`。
- `context.mbt`：构造评估上下文和 flag set。
- `constructors.mbt`：提供面向用户的便捷构造函数。
- `condition.mbt`：实现属性条件和 segment 匹配。
- `engine.mbt`：实现规则顺序评估、关闭状态、fallthrough 和稳定百分比分流。
- `validate.mbt`：实现配置诊断。
- `cmd/main`：提供最小可运行示例。

## 评估流程

1. 如果 flag 处于关闭状态，直接返回 `off_variant`。
2. 按声明顺序扫描规则。
3. 每条规则必须满足全部条件和全部 segment 引用。
4. 命中规则后优先执行 rollout；没有 rollout 时返回直接配置的 variant。
5. 没有命中规则时执行 fallthrough rollout 或 fallthrough variant。
6. 评估结果包含 `variant`、`reason`、`matched`、`rule_key`、`bucket` 和 `warnings`，便于调试和审计。

## 分流算法

`rollout_bucket(seed, flag_key, user_key)` 将 seed、flag key 和 user key 拼接后进行确定性哈希，输出 `0..<10000` 的桶号。`Rollout` 使用基点权重累计选择变体：`10000` 表示 100%，`2500` 表示 25%。未覆盖的桶会返回默认变体并携带警告。

## 功能边界

当前版本专注本地评估，不内置远程配置拉取、持久化、网络同步、加密随机数或 JSON/YAML 解析。这样可以让核心逻辑保持稳定、可测试，并方便后续按生态需求扩展配置加载层。
