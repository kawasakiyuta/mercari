# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


grade_one = Category.create(name: "中学一年")

one_quantity = grade_one.children.create(name: "数量")
one_function = grade_one.children.create(name: "方程式・関数")
one_shape = grade_one.children.create(name: "図形")

one_quantity.children.create([{name: "正負の数"}, {name: "文字式"}, {name: "資料"}])
one_function.children.create([{name: "比例・反比例"}, {name: "一次方程式"}])
one_shape.children.create([{name: "平面図形"}, {name: "立体図形"}])


grade_two = Category.create(name: "中学二年")

two_quantity = grade_two.children.create(name: "数量")
two_function = grade_two.children.create(name: "方程式・関数")
two_shape = grade_two.children.create(name: "図形")

two_quantity.children.create([{name: "式の計算"}, {name: "確率"}])
two_function.children.create([{name: "連立方程式"}, {name: "一次関数"}])
two_shape.children.create([{name: "平行と合同"}, {name: "証明"}, {name: "図形の性質"}])


grade_three = Category.create(name: "中学三年")

three_quantity = grade_three.children.create(name: "数量")
three_function = grade_three.children.create(name: "方程式・関数")
three_shape = grade_three.children.create(name: "図形")

three_quantity.children.create([{name: "式の計算"}, {name: "平方根"}, {name: "標本調査"}])
three_function.children.create([{name: "二次方程式"}, {name: "二次関数"}])
three_shape.children.create([{name: "三平方の定理"}, {name: "図形の性質"}, {name: "円周角"}])