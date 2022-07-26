from django import template

register = template.Library()


def negative_value(value):
    return -value


def multiply(value, arg):
    return value * arg


def divide(value, arg):
    return value // arg


def expression(value, *args):
    for idx, arg in enumerate(args, 1):
        value = value.replace(f'%{idx}', str(arg))
    return eval(value)



register.filter('negative', negative_value)
register.filter('multiply', multiply)
register.filter('divide', divide)
register.simple_tag(func=expression, name='expression')