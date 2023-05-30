#ifndef GAMMA_INCLUDED
#define GAMMA_INCLUDED

#include "metropolis.hpp"

namespace mc {
class gamma : public metropolis {
public:
    gamma(int npart, double side, double gam);

    // delete copy constructor and assignment operator
    gamma(const gamma& x) = delete;
    gamma& operator=(const gamma& x) = delete;

    ~gamma() override;

    void init_config() override;

protected:
    double potential_one(int k) const override;
    double potential_full() const override;

private:
    double g;
};
} // namespace mc

#endif
