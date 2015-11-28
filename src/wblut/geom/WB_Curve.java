/*
 * 
 */
package wblut.geom;

/**
 * 
 */
public interface WB_Curve {

	/**
	 * 
	 *
	 * @param u
	 * @return
	 */
	public WB_Point curvePoint(double u);

	/**
	 * 
	 *
	 * @param u
	 * @return
	 */
	public WB_Vector curveDirection(double u);

	/**
	 * 
	 *
	 * @param u
	 * @return
	 */
	public WB_Vector curveDerivative(double u);

	/**
	 * 
	 *
	 * @return
	 */
	public double getLowerU();

	/**
	 * 
	 *
	 * @return
	 */
	public double getUpperU();
}