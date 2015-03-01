#ifndef D_SOM_VECTOR_H
#define D_SOM_VECTOR_H

namespace Som {

template <typename BasisType>
class Vector {
public:
    Vector( const BasisType& basis )
        : basis_( basis ) {}

    BasisType get() const {
        return basis_;
    }

    ~Vector() = default;

private:
    BasisType basis_;
};

}

#endif
