-- 在 Supabase 控制台：SQL Editor → New query → 粘贴全文 → Run
-- 表：按「存档 ID」存一条 JSON（名单、开关、分队结果等）

create table if not exists public.team_random_state (
  id text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

comment on table public.team_random_state is '随机分队工具云端存档（id 为页面中的存档 ID）';

alter table public.team_random_state enable row level security;

-- 以下策略允许「匿名角色 anon」通过 REST API 读写任意行。
-- 安全性主要依赖「存档 ID」足够长且保密；anon key 本身会出现在前端，无法防枚举。
-- 若需更高安全级别，请改用登录用户 + RLS，或 Edge Function + service_role。

create policy "team_random_select" on public.team_random_state
  for select using (true);

create policy "team_random_insert" on public.team_random_state
  for insert with check (true);

create policy "team_random_update" on public.team_random_state
  for update using (true);

-- 未添加 delete 策略：默认禁止匿名删除（可在控制台手动删行）
