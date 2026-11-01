-- ============================================================
-- 교재 추가: 그래머 인사이드 스타터 (중등 문법) — 목차 37단계
--
--   Supabase → SQL Editor 에 이 파일 전체를 붙여넣고 Run 하면 교재·목차가 들어갑니다.
--   (화면으로 넣고 싶으면 /books.html → + 교재 추가 → 목차 칸에 「코드 | 제목」 붙여넣기)
--
--   · 맨 앞 「기초 | Grammar Basics」 는 교재 앞쪽의 기초 문법 단원입니다.
--     건너뛸 거면 /books.html 에서 그 줄만 지우고 저장하세요.
--   · 학생 관리의 교재명이 「그래머 인사이드 스타터」 와 **똑같아야** 진도가 자동으로 넘어갑니다.
--   · 여러 번 돌려도 됩니다 — 같은 교재명이 있으면 목차·종류·하루 진도만 새로 덮어쓰고,
--     가격·재고 수량은 건드리지 않습니다.
-- ============================================================

insert into textbooks (subject, name, step, units) values
  ('문법', '그래머 인사이드 스타터', 1, '[
    {"code": "기초", "title": "Grammar Basics"},
    {"code": "CH1-1", "title": "셀 수 있는 명사"},
    {"code": "CH1-2", "title": "셀 수 없는 명사"},
    {"code": "CH1-3", "title": "관사"},
    {"code": "CH2-1", "title": "인칭대명사"},
    {"code": "CH2-2", "title": "this, that, it"},
    {"code": "CH3-1", "title": "be동사의 현재형 1"},
    {"code": "CH3-2", "title": "be동사의 현재형 2"},
    {"code": "CH3-3", "title": "be동사의 과거형"},
    {"code": "CH3-4", "title": "There is/are"},
    {"code": "CH4-1", "title": "일반동사의 현재형 1"},
    {"code": "CH4-2", "title": "일반동사의 현재형 2"},
    {"code": "CH4-3", "title": "일반동사의 과거형 1"},
    {"code": "CH4-4", "title": "일반동사의 과거형 2"},
    {"code": "CH5-1", "title": "형용사"},
    {"code": "CH5-2", "title": "부사"},
    {"code": "CH6-1", "title": "장소를 나타내는 전치사"},
    {"code": "CH6-2", "title": "시간을 나타내는 전치사"},
    {"code": "CH7-1", "title": "동사의 종류 1"},
    {"code": "CH7-2", "title": "동사의 종류 2"},
    {"code": "CH8-1", "title": "can, may"},
    {"code": "CH8-2", "title": "must, have to"},
    {"code": "CH9-1", "title": "일반동사의 현재진행형 1"},
    {"code": "CH9-2", "title": "일반동사의 현재진행형 2"},
    {"code": "CH9-3", "title": "일반동사의 미래형 1"},
    {"code": "CH9-4", "title": "일반동사의 미래형 2"},
    {"code": "CH10-1", "title": "비교급"},
    {"code": "CH10-2", "title": "최상급"},
    {"code": "CH11-1", "title": "명사처럼 쓰는 to부정사"},
    {"code": "CH11-2", "title": "형용사, 부사처럼 쓰는 to부정사"},
    {"code": "CH12-1", "title": "and, but, or"},
    {"code": "CH12-2", "title": "when, before, after, because"},
    {"code": "CH13-1", "title": "who, what"},
    {"code": "CH13-2", "title": "when, where, why"},
    {"code": "CH13-3", "title": "how"},
    {"code": "CH13-4", "title": "부가의문문"},
    {"code": "CH13-5", "title": "명령문, 감탄문"}
  ]'::jsonb)
on conflict (name) do update
  set subject = excluded.subject,
      step    = excluded.step,
      units   = excluded.units;

-- 확인: 단계 수와 첫·마지막 목차
select name, subject, step, jsonb_array_length(units) as 단계수,
       units->0->>'title' as 첫목차, units->-1->>'title' as 마지막목차
from textbooks where name = '그래머 인사이드 스타터';
