/*
 * This file is part of HE_Mesh, a library for creating and manipulating meshes.
 * It is dedicated to the public domain. To the extent possible under law,
 * I , Frederik Vanhoutte, have waived all copyright and related or neighboring
 * rights.
 * 
 * This work is published from Belgium. (http://creativecommons.org/publicdomain/zero/1.0/)
 * 
 */
package wblut.math;

import java.security.InvalidParameterException;
import net.objecthunter.exp4j.Expression;
import net.objecthunter.exp4j.ExpressionBuilder;

/**
 * The Class WB_ConstantParameter.
 *
 * @author Frederik Vanhoutte, W:Blut
 *
 *
 */
public class WB_ExpressionScalarParameter implements WB_ScalarParameter {
    Expression expression;
    String[] variables;

    /**
     * 
     *
     * @param equation 
     * @param vars 
     */
    public WB_ExpressionScalarParameter(final String equation,
	    final String... vars) {
	final ExpressionBuilder expressionBuilder = new ExpressionBuilder(
		equation);
	variables = new String[vars.length];
	for (int i = 0; i < vars.length; i++) {
	    expressionBuilder.variable(vars[i]);
	    variables[i] = vars[i];
	}
	try {
	    expression = expressionBuilder.build();
	} catch (final Exception e) {
	    throw new InvalidParameterException(
		    "Can't parse equation. Please check equation and parameters.");
	}
    }

    /* (non-Javadoc)
     * @see wblut.math.WB_ScalarParameter#evaluate(double[])
     */
    @Override
    public double evaluate(final double... value) {
	for (int i = 0; i < variables.length; i++) {
	    expression.setVariable(variables[i], value[i]);
	}
	double v;
	try {
	    v = expression.evaluate();
	} catch (final ArithmeticException name) {
	    v = Double.NaN;
	}
	return v;
    }
}
