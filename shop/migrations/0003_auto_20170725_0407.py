# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2017-07-25 08:07
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0002_auto_20170725_0355'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='carrito_idcarrito',
            field=models.ForeignKey(blank=True, db_column='carrito_idcarrito', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='shop.Carrito'),
        ),
    ]
