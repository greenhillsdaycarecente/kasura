-- GREENHILLS PHASE II DAYCARE CENTER
-- 2026-2027 MASTERLIST IMPORT
-- Source: GREENHILLS CSC 2026-2027 + ADDITIONAL 2026-2027
-- Imported records: 69 children, 62 parent accounts
-- IMPORTANT: Session (Morning/Afternoon) is intentionally NULL because the source masterlist does not specify it.

begin;

-- Set active school year
update public.settings set school_year = '2026-2027', school_year_end = '2027-03-31' where id = 1;

-- Parent accounts (temporary passwords; change after first login).
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-001', 'parent', 'JENNYLYN PALENCIA', NULL, NULL, 'MARKET VIEW', 'JENNYLYN PALENCIA', 'parent.jennylyn.palencia', 'GHP2@2026-001')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-002', 'parent', 'REEVE RHYZEN COMPUTO', NULL, NULL, 'MARKET VIEW', 'REEVE RHYZEN COMPUTO', 'parent.reeve.rhyzen.computo', 'GHP2@2026-002')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-003', 'parent', 'MA. ALAINE ROCELA', NULL, '9306523610', 'MARKET VIEW', 'MA. ALAINE ROCELA', 'parent.ma.alaine.rocela', 'GHP2@2026-003')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-004', 'parent', 'JANNA M. DELLERA', NULL, NULL, 'MARKET VIEW', 'JANNA M. DELLERA', 'parent.janna.m.dellera', 'GHP2@2026-004')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-005', 'parent', 'RONA DOMINGO', NULL, NULL, 'MARKET VIEW', 'RONA DOMINGO', 'parent.rona.domingo', 'GHP2@2026-005')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-006', 'parent', 'HARRELYN PARCAREY', NULL, NULL, 'MARKET VIEW', 'HARRELYN PARCAREY', 'parent.harrelyn.parcarey', 'GHP2@2026-006')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-007', 'parent', 'ERICA TAPIA', NULL, NULL, 'MARKET VIEW', 'ERICA TAPIA', 'parent.erica.tapia', 'GHP2@2026-007')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-008', 'parent', 'MARIVIC MENDREJE', NULL, NULL, 'MARKET VIEW', 'MARIVIC MENDREJE', 'parent.marivic.mendreje', 'GHP2@2026-008')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-009', 'parent', 'MARY JOY CASING', NULL, NULL, 'MARKET VIEW', 'MARY JOY CASING', 'parent.mary.joy.casing', 'GHP2@2026-009')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-010', 'parent', 'RICHELLE PEÑARIDONDA', NULL, NULL, 'MARKET VIEW', 'RICHELLE PEÑARIDONDA', 'parent.richelle.penaridonda', 'GHP2@2026-010')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-011', 'parent', 'MAJELYN REDOMA', NULL, NULL, 'MARKET VIEW', 'MAJELYN REDOMA', 'parent.majelyn.redoma', 'GHP2@2026-011')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-012', 'parent', 'MICHELLE VILLARUEL', NULL, NULL, 'MARKET VIEW', 'MICHELLE VILLARUEL', 'parent.michelle.villaruel', 'GHP2@2026-012')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-013', 'parent', 'JAY ANN REFORMA', NULL, NULL, 'MARKET VIEW', 'JAY ANN REFORMA', 'parent.jay.ann.reforma', 'GHP2@2026-013')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-014', 'parent', 'CHERYL NISPEROS', NULL, '9319054365', 'MARKET VIEW', 'CHERYL NISPEROS', 'parent.cheryl.nisperos', 'GHP2@2026-014')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-015', 'parent', 'MARIDEL SOLAS', NULL, NULL, 'MARKET VIEW', 'MARIDEL SOLAS', 'parent.maridel.solas', 'GHP2@2026-015')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-016', 'parent', 'LYKA PEDERNAL', NULL, NULL, 'MARKET VIEW', 'LYKA PEDERNAL', 'parent.lyka.pedernal', 'GHP2@2026-016')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-017', 'parent', 'ANALYN ABIHAY', NULL, NULL, 'MARKET VIEW', 'ANALYN ABIHAY', 'parent.analyn.abihay', 'GHP2@2026-017')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-018', 'parent', 'SALVE ARINZOL', NULL, NULL, 'MARKET VIEW', 'SALVE ARINZOL', 'parent.salve.arinzol', 'GHP2@2026-018')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-019', 'parent', 'CHRISTINE MENDREJE', NULL, NULL, 'MARKET VIEW', 'CHRISTINE MENDREJE', 'parent.christine.mendreje', 'GHP2@2026-019')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-020', 'parent', 'MARIVEL ROCELA', NULL, '9507206583', 'MARKET VIEW', 'MARIVEL ROCELA', 'parent.marivel.rocela', 'GHP2@2026-020')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-021', 'parent', 'ZARINA DIONEDO', NULL, NULL, 'MARKET VIEW', 'ZARINA DIONEDO', 'parent.zarina.dionedo', 'GHP2@2026-021')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-022', 'parent', 'MARY JOY EVIO', NULL, NULL, 'MARKET VIEW', 'MARY JOY EVIO', 'parent.mary.joy.evio', 'GHP2@2026-022')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-023', 'parent', 'BALJITE SINGH', NULL, NULL, 'MARKET VIEW', 'BALJITE SINGH', 'parent.baljite.singh', 'GHP2@2026-023')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-024', 'parent', 'ELNIE MADERA', NULL, NULL, 'MARKET VIEW', 'ELNIE MADERA', 'parent.elnie.madera', 'GHP2@2026-024')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-025', 'parent', 'MARICAR MARABE', NULL, NULL, 'MARKET VIEW', 'MARICAR MARABE', 'parent.maricar.marabe', 'GHP2@2026-025')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-026', 'parent', 'ANGELITA DIMAANDAL', NULL, NULL, 'MARKET VIEW', 'ANGELITA DIMAANDAL', 'parent.angelita.dimaandal', 'GHP2@2026-026')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-027', 'parent', 'MEDICARD MANLOGON', NULL, '9815149990', 'MARKET VIEW', 'MEDICARD MANLOGON', 'parent.medicard.manlogon', 'GHP2@2026-027')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-028', 'parent', 'GINA JABIDO', NULL, NULL, 'MARKET VIEW', 'GINA JABIDO', 'parent.gina.jabido', 'GHP2@2026-028')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-029', 'parent', 'ABEGAIL GUTIERREZ', NULL, NULL, 'MARKET VIEW', 'ABEGAIL GUTIERREZ', 'parent.abegail.gutierrez', 'GHP2@2026-029')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-030', 'parent', 'JENNIFER FLORES', NULL, NULL, 'MARKET VIEW', 'JENNIFER FLORES', 'parent.jennifer.flores', 'GHP2@2026-030')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-031', 'parent', 'MARICAR MANLOGON', NULL, '9306180598', 'MARKET VIEW', 'MARICAR MANLOGON', 'parent.maricar.manlogon', 'GHP2@2026-031')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-032', 'parent', 'LYKA PARDILLA', NULL, '9302611710', 'MARKET VIEW', 'LYKA PARDILLA', 'parent.lyka.pardilla', 'GHP2@2026-032')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-033', 'parent', 'PAULENE JOY RAMIREZ', NULL, NULL, 'MARKET VIEW', 'PAULENE JOY RAMIREZ', 'parent.paulene.joy.ramirez', 'GHP2@2026-033')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-034', 'parent', 'Unknown Parent', NULL, NULL, 'PREPARED BY. AISA MARIE D. SANGCAP', 'Unknown Parent', 'parent.unknown', 'GHP2@2026-034')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-035', 'parent', 'SEYCHELLE SALIBIO', NULL, '9920671364', 'MARKET VIEW', 'SEYCHELLE SALIBIO', 'parent.seychelle.salibio', 'GHP2@2026-035')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-036', 'parent', 'JULIETA ACABAL', NULL, NULL, 'MARKET VIEW', 'JULIETA ACABAL', 'parent.julieta.acabal', 'GHP2@2026-036')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-037', 'parent', 'MARICEL BALANE', NULL, '9707949234', 'MARKET VIEW', 'MARICEL BALANE', 'parent.maricel.balane', 'GHP2@2026-037')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-038', 'parent', 'MELANIE CASTILLO', NULL, NULL, 'MARKET VIEW', 'MELANIE CASTILLO', 'parent.melanie.castillo', 'GHP2@2026-038')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-039', 'parent', 'PAUL EMMANUEL DOMINGO', NULL, NULL, 'MARKET VIEW', 'PAUL EMMANUEL DOMINGO', 'parent.paul.emmanuel.domingo', 'GHP2@2026-039')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-040', 'parent', 'KATHERINE PAMARISAN', NULL, '9649915524', 'MARKET VIEW', 'KATHERINE PAMARISAN', 'parent.katherine.pamarisan', 'GHP2@2026-040')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-041', 'parent', 'RHEA P. RANSOYO', NULL, NULL, 'MARKET VIEW', 'RHEA P. RANSOYO', 'parent.rhea.p.ransoyo', 'GHP2@2026-041')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-042', 'parent', 'ANGELA MAE MARANAN', NULL, NULL, 'MARKET VIEW', 'ANGELA MAE MARANAN', 'parent.angela.mae.maranan', 'GHP2@2026-042')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-043', 'parent', 'ROSA CAMILLE JOY FACTOR', NULL, '9702203263', 'MARKET VIEW', 'ROSA CAMILLE JOY FACTOR', 'parent.rosa.camille.joy.factor', 'GHP2@2026-043')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-044', 'parent', 'ROSE ANN PEDERNAL', NULL, NULL, 'MARKET VIEW', 'ROSE ANN PEDERNAL', 'parent.rose.ann.pedernal', 'GHP2@2026-044')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-045', 'parent', 'GLECELYN GRAMOR', NULL, '9853800446', 'MARKET VIEW', 'GLECELYN GRAMOR', 'parent.glecelyn.gramor', 'GHP2@2026-045')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-046', 'parent', 'SWEET R. ANIEL', NULL, NULL, 'MARKET VIEW', 'SWEET R. ANIEL', 'parent.sweet.r.aniel', 'GHP2@2026-046')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-047', 'parent', 'MAGILYN DANDO', NULL, NULL, 'MARKET VIEW', 'MAGILYN DANDO', 'parent.magilyn.dando', 'GHP2@2026-047')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-048', 'parent', 'CLARISSA ORIJUELA', NULL, NULL, 'MARKET VIEW', 'CLARISSA ORIJUELA', 'parent.clarissa.orijuela', 'GHP2@2026-048')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-049', 'parent', 'JAMAECA DONACAO', NULL, '9634701266', 'MARKET VIEW', 'JAMAECA DONACAO', 'parent.jamaeca.donacao', 'GHP2@2026-049')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-050', 'parent', 'HANNAH MAE RESULLAR', NULL, '9309505353', 'MARKET VIEW', 'HANNAH MAE RESULLAR', 'parent.hannah.mae.resullar', 'GHP2@2026-050')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-051', 'parent', 'AMABELLA BLANCA', NULL, NULL, 'MARKET VIEW', 'AMABELLA BLANCA', 'parent.amabella.blanca', 'GHP2@2026-051')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-052', 'parent', 'DIANNE MASILUNGAN', NULL, '9487154601', 'MARKET VIEW', 'DIANNE MASILUNGAN', 'parent.dianne.masilungan', 'GHP2@2026-052')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-053', 'parent', 'RAY JANN HIMOR', NULL, '9566438651', 'MARKET VIEW', 'RAY JANN HIMOR', 'parent.ray.jann.himor', 'GHP2@2026-053')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-054', 'parent', 'CHARLIE SEL RELOX', NULL, '9855412194', 'MARKET VIEW', 'CHARLIE SEL RELOX', 'parent.charlie.sel.relox', 'GHP2@2026-054')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-055', 'parent', 'APRIL SALES', NULL, NULL, 'MARKET VIEW', 'APRIL SALES', 'parent.april.sales', 'GHP2@2026-055')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-056', 'parent', 'MA. FE. F. MALBOG', NULL, '9685112452', 'MARKET VIEW', 'MA. FE. F. MALBOG', 'parent.ma.fe.f.malbog', 'GHP2@2026-056')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-057', 'parent', 'ANGELYN MENDREJE', NULL, NULL, 'MARKET VIEW', 'ANGELYN MENDREJE', 'parent.angelyn.mendreje', 'GHP2@2026-057')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-058', 'parent', 'JAN KAYE PERJES', NULL, '9515235146', 'MARKET VIEW', 'JAN KAYE PERJES', 'parent.jan.kaye.perjes', 'GHP2@2026-058')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-059', 'parent', 'ANNA KRISTINA OJENAL', NULL, '9625622792', 'MARKET VIEW', 'ANNA KRISTINA OJENAL', 'parent.anna.kristina.ojenal', 'GHP2@2026-059')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-060', 'parent', 'RONALYN JOYCE IBONES', NULL, '9361742500', 'MARKET VIEW', 'RONALYN JOYCE IBONES', 'parent.ronalyn.joyce.ibones', 'GHP2@2026-060')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-061', 'parent', 'LYKA LAGAR', NULL, '9350010026', 'MARKET VIEW', 'LYKA LAGAR', 'parent.lyka.lagar', 'GHP2@2026-061')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;
insert into public.users (id, role, full_name, email, contact, address, guardian_name, username, password)
values ('import-parent-2026-062', 'parent', 'JERALD SANGCAP', NULL, '9100411485', 'MARKET VIEW', 'JERALD SANGCAP', 'parent.jerald.sangcap', 'GHP2@2026-062')
on conflict (username) do update set full_name=excluded.full_name, contact=excluded.contact, address=excluded.address, guardian_name=excluded.guardian_name;

-- Remove a previous copy of this import, if any, so the script is safe to re-run.
delete from public.enrollments where child_id like 'GHP2-2026-%';

insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-001', 'parent.jennylyn.palencia', 'approved', 'GHP2-2026-001', 'Daycare', NULL, 'JOSHUA', 'ISMAEL P.', 'AYANGCO', '2021-04-26', 'M', 'GREEHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-002', 'parent.reeve.rhyzen.computo', 'approved', 'GHP2-2026-002', 'Daycare', NULL, 'ZYON', 'JAN', 'COMPUTO', '2023-01-11', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-003', 'parent.ma.alaine.rocela', 'approved', 'GHP2-2026-003', 'Daycare', NULL, 'ASTER', 'MATEO R.', 'DE LEON', '2022-10-19', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-004', 'parent.janna.m.dellera', 'approved', 'GHP2-2026-004', 'Daycare', NULL, 'NEIL', 'XYMON', 'DELLERA', '2022-07-17', 'M', 'PUROK PARANG - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-005', 'parent.rona.domingo', 'approved', 'GHP2-2026-005', 'Daycare', NULL, 'BYRON', 'BRIX U.', 'DOMINGO', '2023-11-30', 'M', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-006', 'parent.harrelyn.parcarey', 'approved', 'GHP2-2026-006', 'Daycare', NULL, 'RAFAEL', 'P.', 'FACTOR', '2021-11-19', 'M', 'PUROK PARANG - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-007', 'parent.harrelyn.parcarey', 'approved', 'GHP2-2026-007', 'Daycare', NULL, 'REYNOLD', 'JR. P.', 'FACTOR', '2022-09-20', 'M', 'PUROK PARANG - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-008', 'parent.erica.tapia', 'approved', 'GHP2-2026-008', 'Daycare', NULL, 'ARVIN', 'O.', 'MANLOGON', '2022-07-17', 'M', 'PUROK PARANG - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-009', 'parent.marivic.mendreje', 'approved', 'GHP2-2026-009', 'Daycare', NULL, 'JOHN', 'DANIEL A.', 'MENDREJE', '2021-08-03', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-010', 'parent.mary.joy.casing', 'approved', 'GHP2-2026-010', 'Daycare', NULL, 'ZIAN', 'MATTHEW C.', 'PEDERNAL', '2022-06-29', 'M', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-011', 'parent.richelle.penaridonda', 'approved', 'GHP2-2026-011', 'Daycare', NULL, 'NEHEMIA', NULL, 'PEÑAREDONDA', '2021-12-18', 'M', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-012', 'parent.richelle.penaridonda', 'approved', 'GHP2-2026-012', 'Daycare', NULL, 'ZACQUEO', NULL, 'PEÑAREDONDA', '2021-12-18', 'M', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-013', 'parent.majelyn.redoma', 'approved', 'GHP2-2026-013', 'Daycare', NULL, 'PRINCE', 'BRYLLE R.', 'PERJES', '2022-01-30', 'M', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-014', 'parent.michelle.villaruel', 'approved', 'GHP2-2026-014', 'Daycare', NULL, 'ARQUEZ', 'V.', 'PEREZ', '2023-05-08', 'M', 'GREENHILLS PHASEIII - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-015', 'parent.jay.ann.reforma', 'approved', 'GHP2-2026-015', 'Daycare', NULL, 'JHANDELLE', 'N.', 'REFORMA', '2022-02-26', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-016', 'parent.cheryl.nisperos', 'approved', 'GHP2-2026-016', 'Daycare', NULL, 'GENIE', 'IVLER N.', 'REY', '2021-12-01', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-017', 'parent.cheryl.nisperos', 'approved', 'GHP2-2026-017', 'Daycare', NULL, 'GENIE', 'RHYCEL N.', 'REY', '2023-01-18', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-018', 'parent.maridel.solas', 'approved', 'GHP2-2026-018', 'Daycare', NULL, 'KENJIE', 'E.', 'SOLAS', '2022-10-24', 'M', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-019', 'parent.lyka.pedernal', 'approved', 'GHP2-2026-019', 'Daycare', NULL, 'KEZIAH', 'DAYNE P.', 'ABATO', '2022-05-11', 'F', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-020', 'parent.analyn.abihay', 'approved', 'GHP2-2026-020', 'Daycare', NULL, 'ZIAH', 'KYLIE J.', 'ABIHAY', '2022-06-29', 'F', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-021', 'parent.salve.arinzol', 'approved', 'GHP2-2026-021', 'Daycare', NULL, 'QUEENCES', 'BRIANE A.', 'CABUG', '2022-01-22', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-022', 'parent.christine.mendreje', 'approved', 'GHP2-2026-022', 'Daycare', NULL, 'ANNICA', 'M.', 'CASTILLO', '2022-08-22', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-023', 'parent.marivel.rocela', 'approved', 'GHP2-2026-023', 'Daycare', NULL, 'SHAIRA', 'ARVIE R.', 'DEL ROSARIO', '2021-12-13', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-024', 'parent.zarina.dionedo', 'approved', 'GHP2-2026-024', 'Daycare', NULL, 'PRINCESS', 'ATHENA', 'DIONEDO', '2022-11-10', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-025', 'parent.mary.joy.evio', 'approved', 'GHP2-2026-025', 'Daycare', NULL, 'JIM', 'AVERY D.', 'EVIO', '2022-10-07', 'F', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-026', 'parent.baljite.singh', 'approved', 'GHP2-2026-026', 'Daycare', NULL, 'QUEENIE', 'S.', 'HERMOSO', '2022-09-13', 'F', 'GRENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-027', 'parent.elnie.madera', 'approved', 'GHP2-2026-027', 'Daycare', NULL, 'CHLOE', 'ELISE M.', 'JORVINA', '2021-12-13', 'F', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-028', 'parent.maricar.marabe', 'approved', 'GHP2-2026-028', 'Daycare', NULL, 'RENESMEE', 'KYRIE M.', 'LOZANO', '2022-08-27', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-029', 'parent.angelita.dimaandal', 'approved', 'GHP2-2026-029', 'Daycare', NULL, 'LHIAN', 'D.', 'MANLAPAZ', '2021-12-25', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-030', 'parent.medicard.manlogon', 'approved', 'GHP2-2026-030', 'Daycare', NULL, 'MICHAELA', 'JADE M.', 'MENDREJE', '2022-04-29', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-031', 'parent.gina.jabido', 'approved', 'GHP2-2026-031', 'Daycare', NULL, 'RHIAN', 'J.', 'MIRANDO', '2022-01-01', 'F', 'GRENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-032', 'parent.abegail.gutierrez', 'approved', 'GHP2-2026-032', 'Daycare', NULL, 'PRINCESS', 'ANGELA G.', 'MONTEREY', '2022-02-10', 'F', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-033', 'parent.jennifer.flores', 'approved', 'GHP2-2026-033', 'Daycare', NULL, 'ASHLEY', 'MALIA F.', 'PATITICO', '2022-10-31', 'F', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-034', 'parent.maricar.manlogon', 'approved', 'GHP2-2026-034', 'Daycare', NULL, 'RIANNA', 'M', 'PEDERNAL', '2022-09-29', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-035', 'parent.lyka.pardilla', 'approved', 'GHP2-2026-035', 'Daycare', NULL, 'JELLAY', 'P.', 'SALEN', '2022-08-10', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-036', 'parent.paulene.joy.ramirez', 'approved', 'GHP2-2026-036', 'Daycare', NULL, 'MARIA', 'KYSHA KEONNA R.', 'TRINIDAD', '2022-06-08', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-037', 'parent.unknown', 'approved', 'GHP2-2026-037', 'Daycare', NULL, 'ITED', '2YRS', 'OLD', NULL, '0', 'PREPARED BY. AISA MARIE D. SANGCAP', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-038', 'parent.unknown', 'approved', 'GHP2-2026-038', 'Daycare', NULL, 'PRE', 'K1 3YRS', 'OLD', NULL, '1', 'CHILD DEVELOPMENT WORKER', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-039', 'parent.unknown', 'approved', 'GHP2-2026-039', 'Daycare', NULL, 'PRE', 'K2 4YRS', 'OLD', NULL, '17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-040', 'parent.seychelle.salibio', 'approved', 'GHP2-2026-040', 'Daycare', NULL, 'AMIR', 'S.', 'ABDO', '2022-10-31', 'M', 'GREEHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-041', 'parent.julieta.acabal', 'approved', 'GHP2-2026-041', 'Daycare', NULL, 'FERDINAND', 'MIGUEL G.', 'ACABAL', '2022-05-11', 'M', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-042', 'parent.maricel.balane', 'approved', 'GHP2-2026-042', 'Daycare', NULL, 'JIMUEL', 'A.', 'BALANE', '2023-08-15', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-043', 'parent.melanie.castillo', 'approved', 'GHP2-2026-043', 'Daycare', NULL, 'RANZ', 'KIEL P.', 'CASTILLO', '2022-12-24', 'M', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-044', 'parent.paul.emmanuel.domingo', 'approved', 'GHP2-2026-044', 'Daycare', NULL, 'DUANNE', 'DOMINIC S.', 'DOMINGO', '2022-10-22', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-045', 'parent.katherine.pamarisan', 'approved', 'GHP2-2026-045', 'Daycare', NULL, 'MIKAEL', 'P.', 'DONACAO', '2023-08-15', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-046', 'parent.rhea.p.ransoyo', 'approved', 'GHP2-2026-046', 'Daycare', NULL, 'JOHN', 'REY, R.', 'MENDREJE', '2022-07-12', 'M', 'PUROK PARANG - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-047', 'parent.angela.mae.maranan', 'approved', 'GHP2-2026-047', 'Daycare', NULL, 'DWYNE', 'JACOB M.', 'NAJERA', '2025-07-31', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-048', 'parent.rosa.camille.joy.factor', 'approved', 'GHP2-2026-048', 'Daycare', NULL, 'KLYDE', 'F.', 'PASAMBA', '2022-01-08', 'M', 'PUROK PARANG - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-049', 'parent.rose.ann.pedernal', 'approved', 'GHP2-2026-049', 'Daycare', NULL, 'NICOLAS', 'REIN P.', 'PEREZ', '2024-06-16', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-050', 'parent.glecelyn.gramor', 'approved', 'GHP2-2026-050', 'Daycare', NULL, 'MATTHEW', 'G.', 'PORNOBI', '2021-10-16', 'M', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-051', 'parent.sweet.r.aniel', 'approved', 'GHP2-2026-051', 'Daycare', NULL, 'JOHN', 'WEYN R.', 'RIONAL', '2021-11-18', 'M', 'PUROK PARANG - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-052', 'parent.magilyn.dando', 'approved', 'GHP2-2026-052', 'Daycare', NULL, 'JHAYDEN', 'D.', 'SARCIA', '2022-05-26', 'M', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-053', 'parent.clarissa.orijuela', 'approved', 'GHP2-2026-053', 'Daycare', NULL, 'MAX', 'LHORENZ O.', 'VELASCO', '2023-02-01', 'M', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-054', 'parent.jamaeca.donacao', 'approved', 'GHP2-2026-054', 'Daycare', NULL, 'ELI', 'SAPNIYA D.', 'AÑONUEVO', '2022-11-23', 'F', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-055', 'parent.jennylyn.palencia', 'approved', 'GHP2-2026-055', 'Daycare', NULL, 'JOSH', 'MARIE P.', 'AYANGCO', '2023-10-06', 'F', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-056', 'parent.hannah.mae.resullar', 'approved', 'GHP2-2026-056', 'Daycare', NULL, 'KYNNAH', 'BRIELLE R.', 'BABAC', '2022-09-18', 'F', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-057', 'parent.amabella.blanca', 'approved', 'GHP2-2026-057', 'Daycare', NULL, 'FRANCHESCKA', 'RUBIE B.', 'FACTOR', '2022-05-03', 'F', 'PUROK PARANG - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-058', 'parent.dianne.masilungan', 'approved', 'GHP2-2026-058', 'Daycare', NULL, 'ARIANNA', 'M.', 'GABRINO', '2022-03-19', 'F', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-059', 'parent.ray.jann.himor', 'approved', 'GHP2-2026-059', 'Daycare', NULL, 'REIGN', 'KALLEN D.', 'HIMOR', '2022-11-04', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-060', 'parent.julieta.acabal', 'approved', 'GHP2-2026-060', 'Daycare', NULL, 'JAYLLA', 'AMARRA R.', 'ILO', '2022-03-20', 'F', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-061', 'parent.charlie.sel.relox', 'approved', 'GHP2-2026-061', 'Daycare', NULL, 'JESSICA', 'R.', 'LAMBET', '2023-12-18', 'F', 'GRENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-062', 'parent.april.sales', 'approved', 'GHP2-2026-062', 'Daycare', NULL, 'KIANA', 'NICA S.', 'LONTOC', '2022-10-01', 'F', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-063', 'parent.ma.fe.f.malbog', 'approved', 'GHP2-2026-063', 'Daycare', NULL, 'ANDREA', 'STEPHANIE F.', 'MALBOG', '2022-12-26', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-064', 'parent.angelyn.mendreje', 'approved', 'GHP2-2026-064', 'Daycare', NULL, 'SAMANTHA', 'NICOLE', 'MENDREJE', '2022-09-24', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-065', 'parent.jan.kaye.perjes', 'approved', 'GHP2-2026-065', 'Daycare', NULL, 'KHALIA', 'ELISSE P.', 'OBCIANA', '2021-10-05', 'F', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-066', 'parent.anna.kristina.ojenal', 'approved', 'GHP2-2026-066', 'Daycare', NULL, 'SOLIEL', 'AMIRA I.', 'OJENAL', '2021-12-12', 'F', 'PUROK PAGKAKAISA - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-067', 'parent.ronalyn.joyce.ibones', 'approved', 'GHP2-2026-067', 'Daycare', NULL, 'ANDY', 'AYESHA I.', 'REFORMA', '2022-11-05', 'F', 'GREENHILLS PHASE I - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-068', 'parent.lyka.lagar', 'approved', 'GHP2-2026-068', 'Daycare', NULL, 'JELLIKA', 'L.', 'RESURECCION', '2022-09-17', 'F', 'GREENHILLS PHASE II - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);
insert into public.enrollments
(id, parent_username, status, child_id, class_section, session, first_name, middle_name, last_name, dob, gender, child_address, nickname, photo_data_url, doc_birth_cert, doc_medical_cert, em_name, em_relationship, em_phone, em_alt_phone, em_address, allergies, blood_type, submitted_at, decided_at, reject_reason)
values
('import-enrollment-2026-069', 'parent.jerald.sangcap', 'approved', 'GHP2-2026-069', 'Daycare', NULL, 'PIA', 'JUDEA D.', 'SANGCAP', '2024-07-08', 'F', 'GREENHILLS PHASE III - MARKET VIEW', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-08-17T00:00:00+08:00', '2026-08-17T00:00:00+08:00', NULL);

commit;