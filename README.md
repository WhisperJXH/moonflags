# MoonFlags

MoonFlags 是一个 MoonBit 原生的功能开关、用户分群、灰度分流和配置校验库。它面向需要在 MoonBit / WebAssembly 应用中做功能发布控制、A/B 测试、边缘配置判定和规则解释的开发者。

## 解决的问题

在实际应用中，功能开关通常不只是一个布尔值，还需要按用户属性、名单、分群和百分比进行稳定分流。MoonFlags 提供纯 MoonBit 实现的规则模型和评估引擎，让库作者可以在不引入外部运行时的情况下完成这些逻辑。

## 安装

```bash
moon add WhisperJXH/moonflags
```

Mooncakes 包名：

```text
WhisperJXH/moonflags
```

## 最小示例

```moonbit
let rollout = @moonflags.Rollout([
  @moonflags.WeightedVariant("control", 6000),
  @moonflags.WeightedVariant("beta", 4000),
], seed="checkout-v1")

let rule = @moonflags.Rule(
  "paid-cn-users",
  conditions=[
    @moonflags.str_eq("country", "CN"),
    @moonflags.bool_eq("paid", true),
  ],
  rollout~,
  reason="paid_user_rollout",
)

let flag = @moonflags.Flag(
  "checkout_flow",
  ["control", "beta"],
  "control",
  rules=[rule],
)

let ctx = @moonflags.Context(user_key="user-42")
  .with_str("country", "CN")
  .with_bool("paid", true)

let result = flag.evaluate(ctx)
```

## 本地运行

```bash
moon check
moon build
moon test
moon run cmd/main
moon package
```

## 核心功能

- `Context`：保存一次评估所需的 `user_key` 和属性。
- `Condition`：支持存在/缺失、字符串等值、整数比较、列表包含、前缀和后缀匹配。
- `Segment`：复用用户名单和属性规则，可被多个 flag 引用。
- `Rule`：按顺序执行目标规则，支持直接变体和百分比分流。
- `Rollout`：使用稳定哈希桶进行 0 到 10000 基点分流。
- `Flag` / `FlagSet`：评估单个开关或一组开关。
- `validate_flag` / `validate_set`：检查无效变体、重复值、未知 segment 和 rollout 权重错误。

## 支持范围

- 支持字符串、整数、布尔值和字符串列表属性。
- 支持规则 AND 语义；需要 OR 时可声明多条规则。
- 支持命名 segment、用户 include/exclude 名单和属性条件。
- 支持 0 到 10000 基点的稳定百分比分流。
- 支持可解释的评估结果：返回命中规则、原因、桶号和警告。

## 暂不支持范围

- 不内置远程配置拉取、数据库存储或网络同步。
- 不内置 JSON / YAML 配置解析器，当前以 MoonBit API 方式声明规则。
- 不提供加密级随机数；rollout 使用确定性哈希，适用于稳定分流而非安全用途。

## 许可证与合规

本项目采用 Apache-2.0 许可证。核心代码为原创 MoonBit 实现，不移植第三方源码，不包含来源不明的素材或私有代码。
