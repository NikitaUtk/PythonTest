def before_feature(context, feature):
    if 'expensive_setup' in feature.tags:
        context.execute_steps('''
                Given logging
            ''')