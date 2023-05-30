#ifndef POLYMER_INCLUDED
#define POLYMER_INCLUDED

#include "metropolis.hpp"

namespace mc {
class polymer : public metropolis {
public:
    polymer(int npart, double side, double bond_k, double bond_l);

    // delete copy constructor and assignment operator
    polymer(const polymer& x) = delete;
    polymer& operator=(const polymer& x) = delete;

    ~polymer() override;

    void init_config() override;

protected:
    double potential_one(int k) const override;
    double potential_full() const override;

private:
    double k;  // bond strength
    double R0; // (maximum) bond length
    double R02;
    double kR02; // prefactor for the chain potential

    void ranmove(double* vec);
};
} // namespace mc

#endif
