\name{Ex4}
\alias{plot_repartitii}

\title{Repartitii pentru diferite dtipuri de ploturi}
\description{
 Reprezentare grafica a densitatii si a functiei de repartitiei pentru diferite tipuri de repartitie.tipurile repartitiilor pot fi de forma explicita sau oarecare~
}
\usage{
        plot_densitate(f, a, b)
        plot_repartitie(f, a, b, type)
        plot_repartitie_gen(f, a, b)
        parse_repartitii_cunoscute(type, is_CDF, *params)

     %!!parametrii variaza in functie de tipul de repartitie !!
}

\examples{

 parse_repartitii_cunoscute("uniform", FALSE, a=5, b=12)
 parse_repartitii_cunoscute("uniform", TRUE, a=5, b=12)
 parse_repartitii_cunoscute("exp", FALSE, lambda=7)
 parse_repartitii_cunoscute("exp", TRUE, lambda=5)
 parse_repartitii_cunoscute("normal", FALSE, mu=2, sigma=3)
 parse_repartitii_cunoscute("normal", TRUE, mu=2, sigma=3)
 parse_repartitii_cunoscute("cauchy", FALSE, location=0, scale=3)
 parse_repartitii_cunoscute("cauchy", TRUE, location=0, scale=3)

}

